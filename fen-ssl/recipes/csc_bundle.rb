certificates = %w(
  csc_bundle.crt
  TrustedSecureCertificateAuthority5.crt
  USERTrustRSAAddTrustCA.crt
  AddTrustExternalCARoot.crt
)

certificates.each do |key_file|
  fen_ssl_install_cert 'install_chain' do
    key_file key_file
  end
end
