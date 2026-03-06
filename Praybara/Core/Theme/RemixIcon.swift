// RemixIcon.swift
// Praybara — Remix Icon Font Integration
//
// RemixIcon v4.9.1 — https://remixicon.com
// Font file: Resources/Fonts/remixicon.ttf
// Must be registered in Info.plist under "Fonts provided by application"
//
// USAGE:
//   Image(remixIcon: .homeFill, size: 24)              // SwiftUI Image
//   Text(RemixIcon.homeFill.character)                  // Text glyph
//   Label("Home", remixIcon: .homeFill, size: 22)       // Label with icon + text
//
// NAMING CONVENTION:
//   ri-home-fill   →  .homeFill
//   ri-arrow-left-s-line → .arrowLeftSLine
//   Each icon has a -line (outline) and -fill variant.

import SwiftUI

// MARK: - RemixIcon Enum

enum RemixIcon: String, CaseIterable {

    // MARK: Auth
    case eyeLine = "\u{ECB5}"         // ri-eye-line
    case eyeOffLine = "\u{ECB7}"      // ri-eye-off-line
    case eyeFill = "\u{ECB4}"         // ri-eye-fill
    case eyeOffFill = "\u{ECB6}"      // ri-eye-off-fill
    case lockLine = "\u{EECE}"        // ri-lock-line
    case lockFill = "\u{EECD}"        // ri-lock-fill
    case lockPasswordLine = "\u{EED0}" // ri-lock-password-line
    case keyLine = "\u{EE71}"         // ri-key-line
    case keyFill = "\u{EE70}"         // ri-key-fill
    case mailLine = "\u{EEF6}"        // ri-mail-line
    case mailFill = "\u{EEF3}"        // ri-mail-fill
    case mailSendLine = "\u{EEFC}"    // ri-mail-send-line
    case userLine = "\u{F264}"        // ri-user-line
    case userFill = "\u{F25F}"        // ri-user-fill
    case userAddLine = "\u{F25E}"     // ri-user-add-line
    case appleFill = "\u{EA3F}"       // ri-apple-fill
    case informationLine = "\u{EE59}" // ri-information-line
    case informationFill = "\u{EE58}" // ri-information-fill
    case errorWarningLine = "\u{ECA1}" // ri-error-warning-line
    case errorWarningFill = "\u{ECA0}" // ri-error-warning-fill
    case checkboxCircleLine = "\u{EB81}" // ri-checkbox-circle-line
    case checkboxCircleFill = "\u{EB80}" // ri-checkbox-circle-fill
    case closeCircleLine = "\u{EB97}" // ri-close-circle-line
    case closeLine = "\u{EB99}"       // ri-close-line
    case closeFill = "\u{EB98}"       // ri-close-fill

    // MARK: Navigation
    case arrowLeftLine = "\u{EA60}"   // ri-arrow-left-line
    case arrowLeftSLine = "\u{EA64}"  // ri-arrow-left-s-line
    case arrowRightLine = "\u{EA6C}"  // ri-arrow-right-line
    case arrowRightSLine = "\u{EA6E}" // ri-arrow-right-s-line
    case arrowDownSLine = "\u{EA4E}"  // ri-arrow-down-s-line
    case arrowUpSLine = "\u{EA78}"    // ri-arrow-up-s-line
    case checkLine = "\u{EB7B}"       // ri-check-line
    case checkFill = "\u{EB7A}"       // ri-check-fill
    case checkDoubleLine = "\u{EB79}" // ri-check-double-line

    // MARK: Tab Bar
    case homeLine = "\u{EE2B}"        // ri-home-line
    case homeFill = "\u{EE26}"        // ri-home-fill
    case homeHeartLine = "\u{EE2A}"   // ri-home-heart-line
    case homeHeartFill = "\u{EE29}"   // ri-home-heart-fill
    case bookOpenLine = "\u{EADB}"    // ri-book-open-line
    case bookOpenFill = "\u{EADA}"    // ri-book-open-fill
    case bookLine = "\u{EAD7}"        // ri-book-line
    case bookFill = "\u{EAD6}"        // ri-book-fill
    case heartLine = "\u{EE0F}"       // ri-heart-line
    case heartFill = "\u{EE0E}"       // ri-heart-fill
    case handHeartLine = "\u{EDF3}"   // ri-hand-heart-line
    case handHeartFill = "\u{EDF2}"   // ri-hand-heart-fill
    case checkboxLine = "\u{EB85}"    // ri-checkbox-line
    case checkboxFill = "\u{EB82}"    // ri-checkbox-fill
    case teamLine = "\u{F1EE}"        // ri-team-line
    case teamFill = "\u{F1ED}"        // ri-team-fill
    case communityLine = "\u{EBBA}"   // ri-community-line

    // MARK: Home / General
    case sunLine = "\u{F1BF}"         // ri-sun-line
    case sunFill = "\u{F1BC}"         // ri-sun-fill
    case sunFoggyLine = "\u{F1BE}"    // ri-sun-foggy-line
    case fireLine = "\u{ED33}"        // ri-fire-line
    case fireFill = "\u{ED32}"        // ri-fire-fill
    case calendarLine = "\u{EB27}"    // ri-calendar-line
    case calendarFill = "\u{EB26}"    // ri-calendar-fill
    case calendarCheckLine = "\u{EB23}" // ri-calendar-check-line
    case calendarCheckFill = "\u{EB22}" // ri-calendar-check-fill
    case notificationLine = "\u{EF9A}" // ri-notification-line
    case notificationFill = "\u{EF99}" // ri-notification-fill
    case notification4Line = "\u{EF96}" // ri-notification-4-line
    case starLine = "\u{F18B}"        // ri-star-line
    case starFill = "\u{F186}"        // ri-star-fill
    case starSmileLine = "\u{F18F}"   // ri-star-smile-line
    case settingsLine = "\u{F0EE}"    // ri-settings-line
    case settingsFill = "\u{F0ED}"    // ri-settings-fill
    case settings4Line = "\u{F0E8}"   // ri-settings-4-line
    case trophyLine = "\u{F22F}"      // ri-trophy-line
    case trophyFill = "\u{F22E}"      // ri-trophy-fill
    case medalLine = "\u{EF28}"       // ri-medal-line
    case medalFill = "\u{EF27}"       // ri-medal-fill
    case medal2Line = "\u{EF26}"      // ri-medal-2-line
    case timeLine = "\u{F20F}"        // ri-time-line
    case timeFill = "\u{F20E}"        // ri-time-fill
    case alarmLine = "\u{EA1B}"       // ri-alarm-line
    case alarmFill = "\u{EA1A}"       // ri-alarm-fill
    case compassLine = "\u{EBC4}"     // ri-compass-line
    case compassFill = "\u{EBC3}"     // ri-compass-fill
    case compassDiscoverLine = "\u{EBC2}" // ri-compass-discover-line

    // MARK: Bible
    case bookmarkLine = "\u{EAE5}"    // ri-bookmark-line
    case bookmarkFill = "\u{EAE4}"    // ri-bookmark-fill
    case searchLine = "\u{F0D1}"      // ri-search-line
    case searchFill = "\u{F0D0}"      // ri-search-fill
    case searchEyeLine = "\u{F0CF}"   // ri-search-eye-line
    case markPenLine = "\u{EF1C}"     // ri-mark-pen-line
    case markPenFill = "\u{EF1B}"     // ri-mark-pen-fill
    case volumeUpLine = "\u{F2A2}"    // ri-volume-up-line
    case volumeUpFill = "\u{F2A1}"    // ri-volume-up-fill
    case volumeDownLine = "\u{F29C}"  // ri-volume-down-line
    case playLine = "\u{F00B}"        // ri-play-line
    case playFill = "\u{F00A}"        // ri-play-fill
    case playCircleLine = "\u{F009}"  // ri-play-circle-line
    case playCircleFill = "\u{F008}"  // ri-play-circle-fill
    case pauseLine = "\u{EFD8}"       // ri-pause-line
    case pauseFill = "\u{EFD7}"       // ri-pause-fill
    case pauseCircleLine = "\u{EFD6}" // ri-pause-circle-line
    case skipForwardLine = "\u{F144}" // ri-skip-forward-line
    case skipBackLine = "\u{F140}"    // ri-skip-back-line
    case headphoneLine = "\u{EE05}"   // ri-headphone-line
    case headphoneFill = "\u{EE04}"   // ri-headphone-fill

    // MARK: Prayer / Habits / Community
    case addLine = "\u{EA13}"         // ri-add-line
    case addFill = "\u{EA12}"         // ri-add-fill
    case addCircleLine = "\u{EA11}"   // ri-add-circle-line
    case addCircleFill = "\u{EA10}"   // ri-add-circle-fill
    case subtractLine = "\u{F1AF}"    // ri-subtract-line
    case editLine = "\u{EC86}"        // ri-edit-line
    case editFill = "\u{EC85}"        // ri-edit-fill
    case edit2Line = "\u{EC80}"       // ri-edit-2-line
    case pencilLine = "\u{EFE0}"      // ri-pencil-line
    case pencilFill = "\u{EFDF}"      // ri-pencil-fill
    case deleteBinLine = "\u{EC2A}"   // ri-delete-bin-line
    case deleteBinFill = "\u{EC29}"   // ri-delete-bin-fill
    case deleteBin5Line = "\u{EC24}"  // ri-delete-bin-5-line
    case moreLine = "\u{EF79}"        // ri-more-line
    case moreFill = "\u{EF78}"        // ri-more-fill
    case more2Line = "\u{EF77}"       // ri-more-2-line
    case shareLine = "\u{F0FE}"       // ri-share-line
    case shareFill = "\u{F0F7}"       // ri-share-fill
    case shareForwardLine = "\u{F0FD}" // ri-share-forward-line
    case sendPlaneLine = "\u{F0DA}"   // ri-send-plane-line
    case sendPlaneFill = "\u{F0D9}"   // ri-send-plane-fill
    case sendPlane2Line = "\u{F0D8}"  // ri-send-plane-2-line
    case thumbUpLine = "\u{F207}"     // ri-thumb-up-line
    case thumbUpFill = "\u{F206}"     // ri-thumb-up-fill
    case thumbDownLine = "\u{F205}"   // ri-thumb-down-line
    case chat1Line = "\u{EB4D}"       // ri-chat-1-line
    case chat1Fill = "\u{EB4C}"       // ri-chat-1-fill
    case chat3Line = "\u{EB51}"       // ri-chat-3-line
    case messageLine = "\u{EF48}"     // ri-message-line
    case messageFill = "\u{EF47}"     // ri-message-fill
    case groupLine = "\u{EDE3}"       // ri-group-line
    case groupFill = "\u{EDE2}"       // ri-group-fill
    case group2Line = "\u{EDE1}"      // ri-group-2-line
    case accountCircleLine = "\u{EA09}" // ri-account-circle-line
    case accountCircleFill = "\u{EA08}" // ri-account-circle-fill
    case shieldLine = "\u{F108}"      // ri-shield-line
    case shieldFill = "\u{F103}"      // ri-shield-fill
    case shieldCheckLine = "\u{F100}" // ri-shield-check-line
    case shieldCheckFill = "\u{F0FF}" // ri-shield-check-fill
    case giftLine = "\u{EDBB}"        // ri-gift-line
    case giftFill = "\u{EDBA}"        // ri-gift-fill
    case gift2Line = "\u{EDB9}"       // ri-gift-2-line

    // MARK: Nature / Spiritual
    case leafLine = "\u{EEA3}"        // ri-leaf-line
    case leafFill = "\u{EEA2}"        // ri-leaf-fill
    case plantLine = "\u{F007}"       // ri-plant-line
    case plantFill = "\u{F006}"       // ri-plant-fill
    case sparklingLine = "\u{F36D}"   // ri-sparkling-line
    case sparklingFill = "\u{F36C}"   // ri-sparkling-fill
    case sparkling2Line = "\u{F36B}"  // ri-sparkling-2-line
    case magicLine = "\u{EEEA}"       // ri-magic-line
    case magicFill = "\u{EEE9}"       // ri-magic-fill
    case flashlightLine = "\u{ED3D}"  // ri-flashlight-line
    case flashlightFill = "\u{ED3C}"  // ri-flashlight-fill
    case lightbulbLine = "\u{EEA9}"   // ri-lightbulb-line
    case lightbulbFill = "\u{EEA6}"   // ri-lightbulb-fill
    case lightbulbFlashLine = "\u{EEA8}" // ri-lightbulb-flash-line
    case lightbulbFlashFill = "\u{EEA7}" // ri-lightbulb-flash-fill
    case landscapeLine = "\u{EE7D}"   // ri-landscape-line
    case landscapeFill = "\u{EE7C}"   // ri-landscape-fill
    case moonLine = "\u{EF75}"        // ri-moon-line
    case moonFill = "\u{EF72}"        // ri-moon-fill
    case moonClearLine = "\u{EF6F}"   // ri-moon-clear-line
    case moonFoggyLine = "\u{EF74}"   // ri-moon-foggy-line
    case cloudLine = "\u{EB9D}"       // ri-cloud-line
    case cloudFill = "\u{EB9C}"       // ri-cloud-fill
    case cloudyLine = "\u{EBA5}"      // ri-cloudy-line
    case cloudyFill = "\u{EBA4}"      // ri-cloudy-fill
    case rainbowLine = "\u{F054}"     // ri-rainbow-line
    case rainbowFill = "\u{F053}"     // ri-rainbow-fill
    case crossLine = "\u{F31B}"       // ri-cross-line
    case mentalHealthLine = "\u{EF30}" // ri-mental-health-line
    case mentalHealthFill = "\u{EF2F}" // ri-mental-health-fill
    case empathizeLine = "\u{EC98}"   // ri-empathize-line
    case empathizeFill = "\u{EC97}"   // ri-empathize-fill

    // MARK: Media / Misc
    case articleLine = "\u{EA7E}"     // ri-article-line
    case articleFill = "\u{EA7D}"     // ri-article-fill
    case fileTextLine = "\u{ED0F}"    // ri-file-text-line
    case fileTextFill = "\u{ED0E}"    // ri-file-text-fill
    case refreshLine = "\u{F064}"     // ri-refresh-line
    case refreshFill = "\u{F063}"     // ri-refresh-fill
    case loopRightLine = "\u{F33F}"   // ri-loop-right-line
    case externalLinkLine = "\u{ECAF}" // ri-external-link-line
    case musicLine = "\u{EF85}"       // ri-music-line
    case musicFill = "\u{EF84}"       // ri-music-fill
    case music2Line = "\u{EF83}"      // ri-music-2-line
    case micLine = "\u{EF50}"         // ri-mic-line
    case micFill = "\u{EF4F}"         // ri-mic-fill
    case micOffLine = "\u{EF52}"      // ri-mic-off-line
    case mapPinLine = "\u{EF14}"      // ri-map-pin-line
    case mapPinFill = "\u{EF13}"      // ri-map-pin-fill
    case phoneLine = "\u{EFEC}"       // ri-phone-line
    case phoneFill = "\u{EFE9}"       // ri-phone-fill
    case awardLine = "\u{EA8A}"       // ri-award-line
    case awardFill = "\u{EA89}"       // ri-award-fill
    case hammerLine = "\u{EDEF}"      // ri-hammer-line
    case hammerFill = "\u{EDEE}"      // ri-hammer-fill
    case barChartLine = "\u{EA9E}"    // ri-bar-chart-line
    case barChartFill = "\u{EA99}"    // ri-bar-chart-fill
    case imageLine = "\u{EE4B}"       // ri-image-line
    case imageFill = "\u{EE4A}"       // ri-image-fill
    case replyLine = "\u{F07A}"       // ri-reply-line
    case replyFill = "\u{F079}"       // ri-reply-fill
    case globalLine = "\u{EDCF}"      // ri-global-line
    case globalFill = "\u{EDCE}"      // ri-global-fill
    case parentLine = "\u{EFCA}"      // ri-parent-line
    case parentFill = "\u{EFC9}"      // ri-parent-fill
    case radarLine = "\u{F04C}"       // ri-radar-line
    case radarFill = "\u{F04B}"       // ri-radar-fill
    case loaderLine = "\u{EECA}"      // ri-loader-line
    case loaderFill = "\u{EEC9}"      // ri-loader-fill

    // MARK: - Computed

    /// The raw Unicode character string for use in Text() or font rendering
    var character: String { rawValue }
}

// MARK: - Font Name

extension RemixIcon {
    static let fontName = "remixicon"
}

// MARK: - SwiftUI Views

/// Renders a RemixIcon as a SwiftUI Image using the icon font.
struct RIcon: View {
    let icon: RemixIcon
    var size: CGFloat = 22
    var color: Color = PraybaraColors.textDarkPrimary

    var body: some View {
        Text(icon.character)
            .font(.custom(RemixIcon.fontName, size: size))
            .foregroundColor(color)
            .lineLimit(1)
    }
}

/// Convenience modifier to apply a RemixIcon with consistent sizing.
extension View {
    func remixIcon(_ icon: RemixIcon, size: CGFloat = 22, color: Color = PraybaraColors.textDarkPrimary) -> some View {
        overlay(
            RIcon(icon: icon, size: size, color: color)
        )
    }
}
