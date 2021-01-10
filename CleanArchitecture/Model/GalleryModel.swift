//
//  Feed.swift
//  CleanArchitecture
//
//  Created by richa on 07/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation
import Foundation

// MARK: - GalleryModel
struct GalleryModel: Codable {
    let total, totalPages: Int?
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let id: String
    let createdAt, updatedAt: String
    let promotedAt: String?
    let width, height: Double
    let color, blurHash: String
    let resultDescription, altDescription: String?
    let urls: Urls
    let links: ResultLinks
    let likes: Int
    let likedByUser: Bool
    let sponsorship: Sponsorship?
    let user: User
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case resultDescription = "description"
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case sponsorship, user, tags
    }
}

// MARK: - ResultLinks
struct ResultLinks: Codable {
    let linksSelf, html, download, downloadLocation: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Sponsorship
struct Sponsorship: Codable {
    let impressionUrls: [String]
    let tagline: String
    let taglineURL: String
    let sponsor: User

    enum CodingKeys: String, CodingKey {
        case impressionUrls = "impression_urls"
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
}

// MARK: - User
struct User: Codable {
    let id: String
    let updatedAt: String?
    let username, name, firstName: String
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks
    let profileImage: ProfileImage
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String
    let portfolio, following, followers: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String
}

// MARK: - Tag
struct Tag: Codable {
    let title: String
    let source: Source?
}

// MARK: - Source
struct Source: Codable {
    let ancestry: Ancestry
    let title: String
    let subtitle: String
    let sourceDescription, metaTitle, metaDescription: String
    let coverPhoto: CoverPhoto

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle
        case sourceDescription = "description"
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - Ancestry
struct Ancestry: Codable {
    let type, category: Category
    let subcategory: Category?
}

// MARK: - Category
struct Category: Codable {
    let slug: Slug
    let prettySlug: PrettySlug

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

enum PrettySlug: String, Codable {
    case animals = "Animals"
    case dog = "Dog"
    case images = "Images"
    case puppies = "Puppies"
}

enum Slug: String, Codable {
    case animals = "animals"
    case dog = "dog"
    case images = "images"
    case puppies = "puppies"
}

// MARK: - CoverPhoto
struct CoverPhoto: Codable {
    let id: String
    let createdAt, updatedAt: String
    let promotedAt: String?
    let width, height: Int
    let color: String
    let blurHash: String
    let coverPhotoDescription: String
    let altDescription: String
    let urls: Urls
    let links: ResultLinks
    let likes: Int
    let likedByUser: Bool
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case coverPhotoDescription = "description"
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case user
    }
}



// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}
