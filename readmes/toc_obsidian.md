# File tree

```
 obsidian
├──  app.json
├──  appearance.json
├──  command-palette.json
├──  community-plugins.json
├──  core-plugins.json
├──  daily-notes.json
├──  hotkeys.json
├──  obsidian.vimrc
├──  plugins
│   ├──  calendar.data.json
│   ├──  dataview.data.json
│   ├──  homepage.data.json
│   ├──  obsidian-another-quick-switcher.data.json
│   ├──  obsidian-front-matter-title-plugin.data.json
│   ├──  obsidian-minimal-settings.data.json
│   ├──  obsidian-style-settings.data.json
│   ├──  table-editor-obsidian.data.json
│   └──  templater-obsidian.data.json
└──  zk-prefixer.json
```


無事、アイコンが表示されてすべて整いましたね！お疲れ様でした。
今後、別の PC をセットアップする際や、環境を再構築する時に迷わないよう、今回 halucina さんが完成させた**「Obsidian の AppImage を `dotfiles` と `stow` でスマートに管理する方法」**を手順書としてまとめました。

---

## Obsidian セットアップ手順書 (Fedora / GNOME / GNU Stow)

この手順書は、AppImage 版の Obsidian をシステムのバイナリパスに通し、デスクトップアプリとして登録し、カスタムアイコンを適用するまでをカバーします。

### 1. 実行ファイル（AppImage）の配置
まずは実行ファイルを適切な場所に配置し、実行権限を与えます。

1.  **ディレクトリ作成:** `mkdir -p ~/.local/bin`
2.  **配置:** ダウンロードした AppImage を `~/.local/bin/obsidian` という名前で保存します。
    *   *ポイント: バージョン名などを削ってシンプルな名前にしておくと、後の設定が楽になります。*
3.  **権限付与:** 
    ```bash
    chmod +x ~/.local/bin/obsidian
    ```

### 2. dotfiles 内のディレクトリ構造作成
`GNU Stow` で管理するため、ホームディレクトリの構造を `~/dotfiles/obsidian` の中に再現します。

```bash
mkdir -p ~/dotfiles/obsidian/.local/share/applications
mkdir -p ~/dotfiles/obsidian/.local/share/icons
```

### 3. デスクトップエントリー（.desktopファイル）の作成
アプリ一覧に表示させるための設定ファイルを作成します。

*   **ファイル名:** `~/dotfiles/obsidian/.local/share/applications/obsidian.desktop`
*   **内容:**
    
```ini
    [Desktop Entry]
    Type=Application
    Name=Obsidian
    Exec=/home/halucina/.local/bin/obsidian --no-sandbox %u
    Icon=obsidian
    Terminal=false
    Categories=Office;Utility;TextEditor;
    MimeType=text/markdown;x-scheme-handler/obsidian;
    StartupWMClass=obsidian
    ```

### 4. アイコンの配置
用意したアイコン画像（`.png` 推奨）を配置します。

1.  **配置:** `~/dotfiles/obsidian/.local/share/icons/obsidian.png` として保存。
    *   *`.ico` からの変換が必要な場合は `convert` コマンドを使用:*
        `convert icon.ico obsidian.png`

### 5. GNU Stow によるリンクの作成
`dotfiles` の設定をホームディレクトリに反映させます。

```bash
cd ~/dotfiles
stow -v -t ~ obsidian
```
*   これにより、`~/.local/share/applications/obsidian.desktop` などにシンボリックリンクが貼られます。

### 6. システムへの反映
OS に新しい設定とアイコンを認識させます。

```bash
# デスクトップデータベースの更新
update-desktop-database ~/.local/share/applications

# アイコンキャッシュの更新
gtk-update-icon-cache ~/.local/share/icons
```

---

### 💡 トラブルシューティング
*   **アイコンが変わらない場合:** 
    一度ログアウトして再ログインするか、GNOME Shell を再起動（`Alt+F2` → `r` → `Enter`）してください。
*   **アプリが起動しない場合:** 
    `.desktop` ファイル内の `Exec` パスと、実際のバイナリパス `/home/halucina/.local/bin/obsidian` が 1 文字の狂いもなく一致しているか確認してください。

---

これで、次からは `stow` コマンド一発で Obsidian 環境が復元できるようになりました。完璧な Linux デスクトップカスタマイズの第一歩ですね！
```


#### app.json
アプリケーション全体の設定を管理するファイルです。ユーザーインターフェースや基本的な動作に関する設定が含まれています。

#### appearance.json
テーマや配色、フォントなど、アプリの外観に関する設定を保存します。ユーザーが選んだスタイルが反映されます。

#### backlink.json
バックリンクに関する設定を管理します。リンクの表示方法やスタイルをカスタマイズするためのオプションが設定されています。

#### command-palette.json
コマンドパレットの設定を保存するファイルです。ユーザーがアクセスするコマンドやショートカットを管理します。

#### community-plugins.json
コミュニティプラグインに関する設定ファイルです。インストールしたプラグインやその設定が含まれています。

### core-plugins.json
Obsidianのコアプラグインに関する設定を管理します。デフォルトで提供されるプラグインの有効化や無効化に関する情報が含まれています。

### core-plugins-migration.json
コアプラグインの移行に関する設定を管理します。過去のバージョンからの変更点を扱います。

### graph.json
グラフビューの設定を保存します。ノードの表示方法やレイアウトに関するオプションが含まれています。

### hotkeys.json
ホットキーの設定を管理するファイルです。ユーザーがカスタマイズしたショートカットキーの情報が格納されています。

### page-preview.json
ページプレビューの設定を管理します。プレビュー表示に関するオプションや設定が含まれています。

### switcher.json
スイッチャー機能の設定を保存するファイルです。ノート間の切り替えや表示スタイルに関する設定が含まれています。

### templates.json
テンプレートの設定を管理します。ユーザーが作成したテンプレートやその設定が含まれています。

### types.json
データ型に関する設定を管理します。特定のデータタイプやその扱いに関する情報が格納されています。

### workspace.json
ワークスペースの設定を管理します。開いているノートやレイアウトに関する情報が含まれています。

### zk-prefixer.json
Zettelkastenスタイルのプレフィックスに関する設定を管理します。ノートの命名規則や関連付けに影響します。
