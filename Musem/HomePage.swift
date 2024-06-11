//
//  SwiftUIView.swift
//  Musem
//
//  Created by Justin Walker on 4/15/24.
//

import SwiftUI
import Firebase
import AVFoundation
import MobileCoreServices
import FirebaseStorage
import UniformTypeIdentifiers



struct HomePage: View {
    @State var audioData: Data?
    @State var texthere = ""
    @State private var audioPlayer: AVAudioPlayer?
    @State private var audioURL: URL?
    @State private var isPlaying = false
    @State private var playbackPosition: TimeInterval = 0
    @State private var audioDuration: TimeInterval = 0
    @State private var selectedStartTime: TimeInterval = 0
    @State private var selectedEndTime: TimeInterval = 30
    @State private var showDocumentPicker = false

    @State private var savedPosts: [Post] = []
    @State private var showPostsList = false

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image("icon")
                        .padding()
                    Spacer(minLength: 100)
                    Image("icon2")
                        .padding()
                }
                .scaledToFit()
                
                Divider()
                    .background(Color.white)
                    .bold()
                    .padding()
                
                ScrollView {
                    HStack {
                        Image("icon")
                            .scaledToFit()
                        
                        Group {
                            TextField("Name", text: $texthere)
                                .background(Color.white)
                            Button(action: {
                                showDocumentPicker = true
                            }) {
                                Text("Upload Audio")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    VStack {
                        if let audioURL = audioURL {
                            HStack {
                                Button(action: playAudio) {
                                    Text("Play")
                                }
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                                Button(action: pauseAudio) {
                                    Text("Pause")
                                }
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                                Button(action: stopAudio) {
                                    Text("Stop")
                                }
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                            
                            Slider(value: $playbackPosition, in: 0...audioDuration, step: 1)
                                .padding()
                                .onChange(of: playbackPosition) { newValue in
                                    seekAudio(to: newValue)
                                }
                            
                            HStack {
                                Text("Start Time")
                                Slider(value: $selectedStartTime, in: 0...audioDuration, step: 1)
                                    .padding()
                            }
                            
                            HStack {
                                Text("End Time")
                                Slider(value: $selectedEndTime, in: 0...audioDuration, step: 1)
                                    .padding()
                            }
                        }
                        
                        Button(action: savePost) {
                            Text("Post")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    ForEach(savedPosts) { post in
                        VStack {
                            Text(post.text)
                                .foregroundColor(.black)
                            if let audioURL = post.audioURL {
                                Button(action: {
                                    playSavedAudio(from: audioURL)
                                }) {
                                    Text("Play Saved Audio")
                                        .padding()
                                        .background(Color.green)
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
                
                Button(action: {
                    showPostsList = true
                }) {
                    Text("View and Blend Posts")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showPostsList) {
                    PostsListView()
                }
            }
        }
        .sheet(isPresented: $showDocumentPicker) {
            DocumentPicker(onPick: { url in
                audioURL = url
                loadAudio()
            }, url: $audioURL)
        }
        .onAppear(perform: fetchPosts)
    }

    func loadAudio() {
        guard let audioURL = audioURL else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioDuration = audioPlayer?.duration ?? 0
        } catch {
            print("Failed to load audio: \(error)")
        }
    }
    
    func playAudio() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.currentTime = selectedStartTime
        audioPlayer.play()
        isPlaying = true
        startTimer()
    }
    
    func pauseAudio() {
        audioPlayer?.pause()
        isPlaying = false
    }
    
    func stopAudio() {
        audioPlayer?.stop()
        isPlaying = false
        audioPlayer?.currentTime = 0
        playbackPosition = 0
    }
    
    func seekAudio(to time: TimeInterval) {
        audioPlayer?.currentTime = time
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            guard let audioPlayer = audioPlayer else {
                timer.invalidate()
                return
            }
            if audioPlayer.isPlaying {
                playbackPosition = audioPlayer.currentTime
                if audioPlayer.currentTime >= selectedEndTime {
                    stopAudio()
                }
            } else {
                timer.invalidate()
            }
        }
    }

    func savePost() {
        guard let audioURL = audioURL else {
            // Handle case where audio is not selected
            saveTextPost()
            return
        }
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let audioRef = storageRef.child("audios/\(UUID().uuidString).m4a")
        
        audioRef.putFile(from: audioURL, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading audio: \(error)")
                return
            }
            audioRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting audio URL: \(error)")
                    return
                }
                guard let downloadURL = url else { return }
                saveTextPost(audioURL: downloadURL)
            }
        }
    }
    
    func saveTextPost(audioURL: URL? = nil) {
        let db = Firestore.firestore()
        let post = Post(id: UUID().uuidString, text: texthere, audioURL: audioURL)
        
        do {
            try db.collection("posts").document(post.id).setData(from: post)
            savedPosts.append(post)
            texthere = ""
            self.audioURL = nil
        } catch let error {
            print("Error writing post to Firestore: \(error)")
        }
    }
    
    func playSavedAudio(from url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to play saved audio: \(error)")
        }
    }
    
    func fetchPosts() {
        let db = Firestore.firestore()
        db.collection("posts").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching posts: \(error)")
                return
            }
            savedPosts = snapshot?.documents.compactMap { document in
                try? document.data(as: Post.self)
            } ?? []
        }
    }
}

struct Post: Identifiable, Codable, Hashable {
    var id: String
    var text: String
    var audioURL: URL?
}

struct DocumentPicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker

        init(parent: DocumentPicker) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let selectedURL = urls.first else { return }
            parent.url = selectedURL
            parent.onPick(selectedURL)
        }
    }

    var onPick: (URL) -> Void
    @Binding var url: URL?

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.audio])
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}

struct PostsListView: View {
    @State private var posts: [Post] = []
    @State private var selectedPosts: Set<Post> = []
    @State private var blendedAudio: BlendedAudio?
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isBlending = false

    var body: some View {
        NavigationView {
            List(posts, id: \.id, selection: $selectedPosts) { post in
                HStack {
                    Text(post.text)
                        .foregroundColor(.black)
                    if let audioURL = post.audioURL {
                        Button(action: {
                            playAudio(from: audioURL)
                        }) {
                            Text("Play")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .navigationBarItems(trailing: Button(action: {
                Task {
                    await blendSelectedAudios()
                }
            }) {
                Text("Blend Audios")
            })
        }
        .onAppear {
            fetchPosts()
        }
        .sheet(item: $blendedAudio) { blendedAudio in
            VStack {
                Text("Blended Audio")
                    .font(.title)
                    .padding()
                Button(action: {
                    playAudio(from: blendedAudio.url)
                }) {
                    Text("Play Blended Audio")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                Button(action: {
                    saveBlendedAudio(to: blendedAudio.url)
                }) {
                    Text("Save Blended Audio")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                Button(action: {
                    deleteBlendedAudio()
                }) {
                    Text("Delete Blended Audio")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
        }
    }

    func fetchPosts() {
        let db = Firestore.firestore()
        db.collection("posts").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching posts: \(error)")
                return
            }
            posts = snapshot?.documents.compactMap { document in
                try? document.data(as: Post.self)
            } ?? []
        }
    }

    func playAudio(from url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error)")
        }
    }

    func blendSelectedAudios() async {
        guard !selectedPosts.isEmpty else { return }
        
        isBlending = true
        
        let audioMixComposition = AVMutableComposition()
        
        let maxDuration: CMTime = CMTime(seconds: 30, preferredTimescale: 1)
        var currentStartTime: CMTime = .zero
        
        for post in selectedPosts {
            guard let audioURL = post.audioURL else { continue }
            let audioAsset = AVURLAsset(url: audioURL)
            guard let audioTrack = try? await audioAsset.loadTracks(withMediaType: .audio).first else { continue }
            let timeRange = CMTimeRange(start: .zero, duration: maxDuration - currentStartTime)
            
            do {
                let audioMixTrack = audioMixComposition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
                try audioMixTrack?.insertTimeRange(timeRange, of: audioTrack, at: currentStartTime)
                currentStartTime = CMTimeAdd(currentStartTime, timeRange.duration)
                
                if currentStartTime >= maxDuration {
                    break
                }
            } catch {
                print("Error inserting audio track: \(error)")
            }
        }
        
        let outputURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString).appendingPathExtension("m4a")
        exportBlendedAudio(composition: audioMixComposition, outputURL: outputURL)
    }

    func exportBlendedAudio(composition: AVMutableComposition, outputURL: URL) {
        guard let exportSession = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetAppleM4A) else { return }
        exportSession.outputURL = outputURL
        exportSession.outputFileType = .m4a
        
        exportSession.exportAsynchronously {
            if exportSession.status == .completed {
                DispatchQueue.main.async {
                    self.blendedAudio = BlendedAudio(url: outputURL)
                    self.isBlending = false
                }
            } else if let error = exportSession.error {
                print("Failed to export audio: \(error)")
                self.isBlending = false
            }
        }
    }

    func saveBlendedAudio(to url: URL) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let audioRef = storageRef.child("blended_audios/\(UUID().uuidString).m4a")
        
        audioRef.putFile(from: url, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading blended audio: \(error)")
                return
            }
            audioRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting blended audio URL: \(error)")
                    return
                }
                guard let downloadURL = url else { return }
                print("Blended audio saved at URL: \(downloadURL)")
                self.blendedAudio = nil
            }
        }
    }

    func deleteBlendedAudio() {
        blendedAudio = nil
    }
}

struct BlendedAudio: Identifiable {
    var id: UUID = UUID()
    var url: URL
}

#Preview {
    HomePage()
}
