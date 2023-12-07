//  DiagnosticsProtocol.swift
//  Letscode
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation
import os

// MARK: - Diagnostics protocol

/**
 Implements diagnostic protocol
 */
protocol DiagnosticsProtocol {
    /**
     Log diagnostic data on firebase crashlytics.
     - Parameters:
        - code: Set code of diagnostic.
        - userInfo: Set user info data.
     */
    func logDiagnostic(code: Int, userInfo: [String: Any])
}

// MARK: - Diagnostics implements

extension DiagnosticsProtocol {
    /**
     Log diagnostic data.
     - Parameters:
        - code: Set code of diagnostic.
        - userInfo: Set user info data.
     */
    func logDiagnostic(code: Int, userInfo: [String: Any]) {
        Diagnostics.shared.logInfo(format: "Log app info: %@", with: [userInfo])
    }
}

// MARK: - Diagnostics

/**
 Diagnostic singleton class
 */
class Diagnostics {
    /**
     Access instance of Diagnostics singleton class.
     */
    static let shared = Diagnostics()

    /**
     Initialize a new instance of Diagnostics.
     */
    private init() {}

    /**
     Log info message on console subsystem log messages.
     - Parameters:
        - message: Set static message for diagnostics log message.
     - Note: Only static strings allowed
     - Example:
     ```
     Diagnostics.shared.logInfo("This is a value %@ for log message")

     ```
     */
    func logInfo(message: StaticString) {
        log(message, .info)
    }

    /**
     Log info message with a format on console subsystem log messages.
     - Parameters:
        - format: Set format message log message.
        - with value: Set values for a message formatted.
     - Example:
     ```
     Diagnostics.shared.logInfo(format: "This is a value %@ for log message", with: ["MyValyeString"])
     ```
     */
    func logInfo(format: StaticString, with value: CVarArg) {
        log(format, .info, value)
    }

    /**
     Log security message with a format on console subsystem log messages.
     - Parameters:
        - format: Set format message log message.
        - with value: Set values for a message formatted.
     - Example:
     ```
     Diagnostics.shared.logSecurity(format: "This is a value %@ for log message", with: ["MyValyeString"])
     ```
     */
    func logSecurity(format: StaticString, with value: CVarArg) {
        log(format, .security, value)
    }

    /**
     Log info message on console subsystem log messages.
     - Parameters:
        - message: Set static message for diagnostics log message.
        - log: Set the type of log that will be used.
     - Note: Only static strings allowed
     - Example:
     ```
     Diagnostics.shared.logInfo("This is a value %@ for log message")
     ```
     */
    private func log(_ message: StaticString, _ log: OSLog) {
        #if DEBUG
        if #available(iOS 14.0, *) {
            os_log(message, log: log, type: .info)
        } else {
            debugPrint(message)
        }
        #endif
    }

    /**
     Log info message with a format on console subsystem log messages.
     - Parameters:
        - format: Set format message log message.
        - log: Set the type of log that will be used.
        - with value: Set values for a message formatted.
        - error: Set error info for log in crashlytics.
     - Example:
     ```
     Diagnostics.shared.logInfo(format: "This is a value %@ for log message", with: ["MyValyeString"])
     ```
     */
    private func log(_ format: StaticString, _ log: OSLog, _ value: CVarArg, _ error: NSError? = nil) {
        #if DEBUG
        let bundle = Bundle.main.bundleIdentifier ?? "bundle vazio"
        print("bundle identifier: \(bundle)")
        if #available(iOS 14.0, *) {
            os_log(format, log: log, value)
        } else {
            debugPrint(format)
        }
        #endif
    }
}

// MARK: - OSLog

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier ?? "AppName"
    static let info = OSLog(subsystem: subsystem, category: "DiagnosticInfo")
    static let security = OSLog(subsystem: subsystem, category: "SecurityInfo")
}
