cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "58efd62ca1189aecd7b5748757dba93b666127a3d4eb1e478aa79a9fefb5000d",
         intel: "44633e40fb55cd3281d0765895c1aea9efb40ff52ad543bffd677bc3b7942ecb"

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
