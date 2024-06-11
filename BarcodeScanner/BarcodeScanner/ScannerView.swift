//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by David Zhu on 2024-06-09.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
            ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    // Automatically called when ScannerView get initialized.
    func makeCoordinator() -> Coordinator {
            Coordinator(scannedCode: $scannedCode, alertItem: $alertItem)
    }
    
    // Coordinator acts as a bridge between UIKit and SwiftUI.
    // Coordinator is a class, classes in Swift require to explicitly define
    // how their properties are initialized, unless all properties have default values.
    final class Coordinator: NSObject, ScannerVCDelegate {
        @Binding private var scannedCode: String
        @Binding private var alertItem: AlertItem?
        
        init(scannedCode: Binding<String>, alertItem: Binding<AlertItem?>) {
            _scannedCode = scannedCode
            _alertItem = alertItem
        }

        func didFind(barcode: String) {
            self.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                self.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                self.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}

#Preview {
    ScannerView(scannedCode: .constant(""), alertItem: .constant(nil))
}
