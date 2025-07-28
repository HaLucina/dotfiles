# Directory tree

```

```

## [bin](./bin/README_bin.md)
## [Auto Hot Key](./ahk/README_ahk.md)
## [Bash](./bash/README_bash.md)
## [ChangeKey](./chgkey/README_chgkey.md)
## [Neovim](./nvim/README_nvim.md)
## [Obsidian](./obsidian/README_obsidian.md)
## [Openbox](./openbox/README_openbox.md)
## [Vim](./vim/README_vim.md)
## [WSL](./wsl/README_wsl.md)
## [Zsh](./zsh/README_zsh.md)


memo

READMEの階層化: プロジェクトの規模が大きくなるにつれて、トップレベルのREADMEが肥大化する可能性があります。その場合は、docs/ディレクトリを作成し、その中に各コンポーネントや機能ごとの詳細なREADMEファイルを配置し、トップレベルのREADMEからリンクを張るなど、階層化を検討してください。

.
├── README.md             // プロジェクト全体の概要、主要なリンク
├── src/
│   └── ...
└── docs/
    ├── architecture.md   // アーキテクチャの概要
    ├── api.md            // APIドキュメントの概要とリンク
    ├── components/
    │   ├── Button.md     // 特定コンポーネントの詳細
    │   └── Form.md
    └── deployment.md     // デプロイ手順
「なぜ (Why)」を重視する: ソースコードのコメントが嘘になりやすいのは、「何を (What)」や「どのように (How)」を記述しがちだからです。READMEや関連ドキュメントでは、そのコードが存在する「なぜ (Why)」や、その設計の「意図 (Intention)」を記述することに重点を置くと、情報の陳腐化を防ぎやすくなります。実装の詳細はコードを見ればわかりますが、その設計に至った背景はドキュメントにしか書けません。

ドキュメントレビュー: コードレビューと同様に、重要なドキュメント（特にREADMEや設計ドキュメント）も定期的にレビューする習慣をつけることで、情報の精度と鮮度を保ちやすくなります。

自動化の検討: もし可能であれば、ドキュメントの生成やバリデーションをCI/CDパイプラインに組み込むことで、ドキュメントの品質を維持しやすくなります。

シングルソース・オブ・トゥルース (Single Source of Truth): ある情報について複数の場所に記述があると、どこが正しいのかわからなくなります。特に重要な情報については、一箇所に集約し、そこを参照するように徹底すると良いでしょう。例えば、「デプロイ手順」はdeployment.mdにのみ記述し、他の場所からはそのファイルへのリンクを張る、といった運用です。
