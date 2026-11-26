cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "35a3a468433ea193d4282a49995eb03519191cd06581cd9e3ff3ca6c5bab6b78",
         intel: "7b72a0e1e7b59e899ad78510bd72930a43eaebfee21fde2f0fe4f6a280d9ba9f"

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
