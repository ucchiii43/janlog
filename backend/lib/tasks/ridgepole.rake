namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    exit! unless Rails.env.local?

    ridgepole('--apply', '-E development', '-s primary', "-f #{schema_file}", '--drop-table')
    ridgepole('--apply', '-E test', '-s primary', "-f #{schema_file}", '--drop-table')

    # モデルファイルにアノテーションを追加する
    system('bundle exec annotaterb models') if Rails.env.local?
  end

  private

  def ridgepole(*options)
    command = ['bundle exec ridgepole', "-c #{config_file}"]
    system([command + options].join(' '))
  end


  def schema_file
    Rails.root.join('db', 'Schemafile')
  end

  def config_file
    Rails.root.join('config', 'database.yml')
  end
end
