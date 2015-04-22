require 'formula'

class Quex < Formula
  homepage 'http://quex.org/'
  url 'https://downloads.sourceforge.net/project/quex/DOWNLOAD/quex-0.65.4.tar.gz'
  sha1 '11f9b6ed9c7dc9380bca4f6c20eb0abfe96f3b9d'

  def install
    libexec.install 'demo', 'quex', 'quex-exe.py'

    # Use a shim script to set QUEX_PATH on the user's behalf
    (bin+'quex').write <<-EOS.undent
      #!/bin/bash
      QUEX_PATH="#{libexec}" "#{libexec}/quex-exe.py" "$@"
    EOS
  end

  test do
    system "#{bin}/quex", "--help"
  end
end
