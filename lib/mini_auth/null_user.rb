module MiniAuth
  require "naught"

  NullUser = Naught.build do |config|
    config.black_hole
    config.predicates_return false

    def empty?
      true
    end

    def nil?
      true
    end

    def blank?
      true
    end
  end
end
