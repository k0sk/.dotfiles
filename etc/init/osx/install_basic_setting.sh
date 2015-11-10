# Show All File Extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show All Hidden Files
defaults write com.apple.finder AppleShowAllFiles true

# Hide All Desktop Icons
defaults write com.apple.finder CreateDesktop -bool false

# Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Allow Text Selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true
killall Finder

# Disable Creation of Metadata Files on Network/USB Volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

