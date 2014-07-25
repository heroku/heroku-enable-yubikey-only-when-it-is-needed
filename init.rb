class Heroku::Auth
  class << self
    alias_method :_orig_ask_for_second_factor, :ask_for_second_factor
    def ask_for_second_factor
      `osascript -e 'tell application "yubiswitch" to KeyOn'`
      result = _orig_ask_for_second_factor
      `osascript -e 'tell application "yubiswitch" to KeyOff'`
      result
    end
  end
end
