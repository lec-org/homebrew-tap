cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "37499bed2762e6f9da4740e55eb0cb66883f84d72bf09a9a5b724d3ab3f56e0d",
         intel: "585b3766be91de119afd8716f4e2b906c1cb18d5a958c49bfde0da43344c674f"

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
