Gem::Specification.new do |spec|
    spec.name = "argus-ruby"
    spec.version = "1.0.0"
    spec.summary = 'Argus Ruby client library'
    spec.description = <<~DESCRIPTION
    This is the official Ruby library for the ARGUS Engine, 
    this library helps Ruby developers and applications seamlessly integrate to the ARGUS Engine, authentication and event listening.
    DESCRIPTION
  
    spec.author = 'Kelechi Onyekwere'
    spec.license = 'MIT'
    spec.homepage = 'https://github.com/khelechy/argus-ruby'
    spec.metadata['source_code_uri'] = spec.homepage
    spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  
    spec.files = Dir['lib/**/*'] << '.yardopts'
    spec.extra_rdoc_files = %w[README.md LICENSE]
  end