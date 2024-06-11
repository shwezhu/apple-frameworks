//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by David Zhu on 2024-06-09.
//


import SwiftUI
import Observation

// SwiftUI will track all views that access the properties of @Observable class.
// Every time the properties of this class change, will triger UI updates.
@Observable final class BarcodeScannerViewModel {
    var scannedCode = ""
    var alertItem: AlertItem? = nil
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
