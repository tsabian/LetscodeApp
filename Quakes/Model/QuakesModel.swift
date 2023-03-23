//  QuakesModel.swift
//  Quakes
//
//  Created by Tiago Oliveira on 09/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//  Source: https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php

import Foundation

// MARK: - QuakesModel

struct QuakesModel: Codable {
    let type: String
    let metadata: Metadata
    let features: [Feature]
    let bbox: [Double]
}

// MARK: - Feature

struct Feature: Codable {
    let type: FeatureType
    let properties: Properties
    let geometry: Geometry
    let id: String
}

// MARK: - Geometry

struct Geometry: Codable {
    let type: GeometryType
    let coordinates: [Double]
}

enum GeometryType: String, Codable {
    case point = "Point"
}

// MARK: - Properties

struct Properties: Codable, Hashable {
    let mag: Double
    let place: String
    let time, updated: Int
    let tz: Int?
    let url: String
    let detail: String
    let felt: Int?
    let cdi, mmi: Double?
    let alert: Alert?
    let status: Status
    let tsunami, sig: Int
    let net: Net
    let code, ids: String
    let sources: String?
    let types: String
    let nst: Int?
    let dmin: Double?
    let rms: Double
    let gap: Double?
    let magType: MagType
    let type: PropertiesType
    let title: String
}

enum Alert: String, Codable {
    case green
    case red
}

enum MagType: String, Codable {
    case mb
    case mbLg = "mb_lg"
    case md
    case mh
    case ml
    case mw
    case mwr
    case mww
}

enum Net: String, Codable {
    case ak
    case av
    case ci
    case hv
    case nc
    case nm
    case nn
    case ok
    case pr
    case se
    case tx
    case us
    case uu
    case uw
}

enum Status: String, Codable {
    case automatic
    case reviewed
}

enum PropertiesType: String, Codable {
    case earthquake
    case explosion
    case iceQuake = "ice quake"
    case otherEvent = "other event"
    case quarryBlast = "quarry blast"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}

// MARK: - Metadata

struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}
