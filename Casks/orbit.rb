cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "8843424fe7f8c91c78ac1068675708652cab1c08801c50014f30d5d66502a0a9",
         intel: "150b9848e71ced28580960dfb28edda6005738650c7387f52ede9836f9cd0502"

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
