# Set DOCKER_HOST for Windows to talk to Docker inside WSL
[Environment]::SetEnvironmentVariable("DOCKER_HOST", "tcp://localhost:2375", "User")

Write-Host "✅ Docker environment variable set. You can now run Docker from PowerShell!" -ForegroundColor Green