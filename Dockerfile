# ruby:2.4.5のイメージをベースとする
FROM ruby:2.4.5
# ruby:2.4.5のイメージからコンテナを起動してコンテナ内で実行するコマンドを定義
# build-essentialとnodejsのパッケージをインストール
# mysql-clientがないとdbconsoleが使えない
RUN apt-get update -qq && apt-get install -y build-essential nodejs mysql-client
# ルートディレクトリに/appディレクトリ作成。appディレクトリ内にrailsのプロジェクトファイルを作成する
RUN mkdir /app
# 作業ディレクトリを/appディレクトリに移動
WORKDIR /app
# PC上にあるGemfileをコンテナの中の/appディレクトリにコピーアンドペースト。Gemfileにはrailsとrailsのバージョンを記載する
COPY Gemfile /app/Gemfile
# PC上にあるGemfile.lockをコンテナの中の/appディレクトリにコピーアンドペースト
COPY Gemfile.lock /app/Gemfile.lock
# Gemfileに記載してあるgemをインストールすることができる
RUN bundle install
# Dockerfileの置いてあるディレクトリの内容全てをコンテナ内の/appにコピーアンドペースト
COPY . /app
