cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "1e3068ac2494eb40601415d825f0712c65433a7276d6bf4afcd54288b2e59898",
         intel: "5eb98a64e9925aaad549381a637f1af894365514cef59c7e872e5d7c4b75ffdb"

  url "https://github.com/lec-org/lec-orbit/releases/download/v#{version}/Orbit-#{version}-mac-#{arch}.dmg"
  name "Orbit"
  desc "LEC 软件工作室统一桌面工作台与 LecSSO 原生桌面认证器"
  homepage "https://lec-org.github.io/lec-orbit/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Orbit.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Orbit.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Orbit",
    "~/Library/Preferences/top.lecspace.orbit.plist",
    "~/Library/Saved Application State/top.lecspace.orbit.savedState",
  ]
end
