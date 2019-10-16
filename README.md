# action-create-release

![screenshot](./release-screenshot.png)

🕷 Build and release APK from your React-Native project

## Warning ⚠
Add a target branch (eg. master) to build the APK to prevent infinite loop (releasing the APK on the release tag will trigger a rerun of the action).

## Usage

To use the action simply add the following lines to your `.github/workflows/android.yml` and provide the required Secrets and Environment variables.

#### YML
```
name: Publish Release APK
on:
 push:
  branches:
   - master
jobs:
 build:
  runs-on: ubuntu-latest
  steps:
   - uses: actions/checkout@master
   - name: Publish Release APK
     uses: siristechnology/action-create-release@master
     env:
      GITHUB_TOKEN: ${{ secrets.TOKEN }}
      RELEASE_FILE_PATH: android/app/build/outputs/apk/release/app-release.apk
      RELEASE_TITLE: "New Build"
```

### Secrets

You'll need to provide this secret token to use the action (for publishing the APK). Enter these secrets in your Settings > Secrets

* **TOKEN**: Create a new [access token](https://github.com/settings/tokens) with `repo` access.

I am unsure as to why using the default `GITHUB_TOKEN` provided universally will fail to authorize the user. This is the only workaround that I'd found.

### Environment Variables

You'll need to provide these environment variables to specify exactly what information is needed to build the APK.

* **RELEASE_FILE_PATH**: path of the file to be added to the release
* **RELEASE_TITLE**: title for release

## Credits

Based off [ShaunLWM/action-release-debugapk](https://github.com/ShaunLWM/action-release-debugapk)
