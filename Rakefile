task :default do
  begin
    {
      'centos-6-openjdk-7-jre' => {base_image: 'centos:6', additional_packages: ['unzip', 'git', 'which', 'java-1.7.0-openjdk']},
      'centos-6-openjdk-8-jre' => {base_image: 'centos:6', additional_packages: ['unzip', 'git', 'which', 'java-1.8.0-openjdk']},
      'centos-7-openjdk-7-jre' => {base_image: 'centos:7', additional_packages: ['unzip', 'git', 'which', 'java-1.7.0-openjdk']},
      'centos-7-openjdk-8-jre' => {base_image: 'centos:7', additional_packages: ['unzip', 'git', 'which', 'java-1.8.0-openjdk']},
    }.each do |image, desc|
      sh('git checkout master')
      sh("git branch -D #{image}")
      sh("git checkout -b #{image}")

      File.open('Dockerfile', 'w') do |f|
        f.puts("FROM #{desc[:base_image]}")
        f.puts("MAINTAINER GoCD Team <go-cd@googlegroups.com>")
        f.puts("RUN yum install --assumeyes #{desc[:additional_packages].join(' ')}")
      end

      sh('git add Dockerfile')
      sh("git commit -m 'Updating dockerfile' || true")
    end

    {
      'gocd-go-agent-centos-6-openjdk-7-jre' => {base_image: 'ketan/installer-testing:centos-6-openjdk-7-jre'},
      'gocd-go-agent-centos-6-openjdk-8-jre' => {base_image: 'ketan/installer-testing:centos-6-openjdk-8-jre'},
      'gocd-go-agent-centos-7-openjdk-7-jre' => {base_image: 'ketan/installer-testing:centos-7-openjdk-7-jre'},
      'gocd-go-agent-centos-7-openjdk-8-jre' => {base_image: 'ketan/installer-testing:centos-7-openjdk-8-jre'},
    }.each do |image, desc|
      sh('git checkout master')
      sh("git branch -D #{image}")
      sh("git checkout -b #{image}")

      File.open('Dockerfile', 'w') do |f|
        f.puts("FROM #{desc[:base_image]}")
        f.puts("MAINTAINER GoCD Team <go-cd@googlegroups.com>")
        f.puts("ADD https://bintray.com/gocd/gocd-rpm/rpm /etc/yum.repos.d/gocd.repo")
        f.puts("RUN yum install --assumeyes go-agent")
      end

      sh('git add Dockerfile')
      sh("git commit -m 'Updating dockerfile' || true")
    end
  end
end
