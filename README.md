# nix-config

nix-darwin + home-manager 기반 macOS (aarch64-darwin) 설정.

## 새 컴퓨터 세팅

### 1. Nix 설치

```bash
sh <(curl -L https://nixos.org/nix/install)
```

설치 후 터미널을 재시작한다.

### 2. Homebrew 설치

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. 저장소 클론

```bash
git clone https://github.com/wannte/nix-config.git ~/.config/nix
cd ~/.config/nix
```

### 4. 호스트 추가

`flake.nix`의 `darwinConfigurations`에 새 컴퓨터의 hostname을 추가한다.

```bash
hostname -s  # 현재 hostname 확인
```

```nix
darwinConfigurations = {
  "wanntes-MacBook-Air" = mkDarwinConfig "wanntes-MacBook-Air";
  "wanntes-MacBook-Pro" = mkDarwinConfig "wanntes-MacBook-Pro";
  "new-hostname" = mkDarwinConfig "new-hostname";  # 추가
};
```

### 5. 첫 빌드 (nix-darwin 부트스트랩)

최초 실행 시 `darwin-rebuild`가 아직 없으므로 `nix run`으로 실행한다.

```bash
sudo nix run --extra-experimental-features "nix-command flakes" nix-darwin -- switch --flake .
```

이후부터는 `make deploy`로 적용할 수 있다.

## 사용법

```bash
make deploy   # 설정 적용
make fmt      # nix 파일 포맷팅
make update   # flake inputs 업데이트
```
