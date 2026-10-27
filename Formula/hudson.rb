class Hudson < Formula
  desc "Operate Hudson agents and sandboxes"
  homepage "https://github.com/hudson-frontier/hudson-cli"
  url "https://github.com/hudson-frontier/hudson-cli/archive/dd83d4866e6076493353546578a78f52d60f3202.tar.gz"
  version "0.1.1"
  sha256 "0ae4f88d88db09acf072d984b0d89cce3831530e5bf5940a81e625c9938be2cd"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/hudson-frontier/homebrew-tap/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bbc27a5af5bdb5065a8d005bff2f6dbe84a88daac0e6dc91fb5fb8230f6a3539"
    sha256 cellar: :any,                 x86_64_linux:  "60f8556888920dc9962e39f5f23586b3664e068a841a1a795638b0018e004e1b"
  end

  depends_on "rust" => :build

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64
  end

  deny_network_access!

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args, "--bin", "hudson"
    generate_completions_from_executable(bin/"hudson", "completion")
    doc.install "docs", "README.md", "CHANGELOG.md", "CONTRIBUTING.md", "SECURITY.md", "LICENSE", "NOTICE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hudson --version")
    assert_match "sandbox", shell_output("#{bin}/hudson --help")
    key = testpath/"mutation.key"
    system bin/"hudson", "sandbox", "--json", "key", "--to", key
    saved = key.read
    refute_empty saved.strip
    assert_operator saved.strip.length, :<=, 128
    assert_equal 0600, key.stat.mode & 0777
    shell_output("#{bin}/hudson sandbox --json key --to mutation.key", 1)
    assert_equal saved, key.read
  end
end
