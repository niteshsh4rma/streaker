setup:
	fvm flutter clean && fvm flutter pub get

generate:
	fvm dart run build_runner build -d

add:
	fvm flutter pub add $(package)

add-dev:
	fvm flutter pub add --dev $(package)

remove:
	fvm flutter pub remove $(package)

upgrade:
	fvm flutter pub upgrade

icons:
	fvm dart run flutter_launcher_icons:main

splash:
	fvm dart run flutter_native_splash:create

lint:
	fvm dart run custom_lint

# Path: makefile