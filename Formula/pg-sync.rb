# Homebrew formula for pg-sync
#
# To install:
#   brew tap nixrajput/pg-sync
#   brew install pg-sync
#
# Releasing a new version:
#   1. Push a tag (e.g. v2.0.1).
#   2. GitHub Actions builds and publishes the tarball.
#   3. Update `url`, `version`, and `sha256` below to match the new release.
#   4. Commit and push this file to your tap repo
#      (homebrew-pg-sync on the same GitHub account).

class PgSync < Formula
  desc "Interactive PostgreSQL dump / restore / sync helper for RDS-style databases"
  homepage "https://github.com/nixrajput/pg-sync"
  url "https://github.com/nixrajput/pg-sync/releases/download/v1.1.0/pg-sync-1.1.0.tar.gz"
  version "1.1.0"
  sha256 "af9945d15fe800354701d9b2a858c58c4af236aae3ec6deb17e72a3c141c12ec"
  license "MIT"

  depends_on "bash"
  depends_on "postgresql@19" => :recommended

  def install
    bin.install "bin/pg-sync"
    doc.install "README.md", "CHANGELOG.md", "LICENSE"
  end

  test do
    assert_match "pg-sync", shell_output("#{bin}/pg-sync --version")
  end
end
