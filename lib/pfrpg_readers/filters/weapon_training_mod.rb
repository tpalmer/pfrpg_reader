module PfrpgReaders
  module Filters
    class WeaponTrainingMod
      attr_reader :character, :feature
      def initialize(character, feature)
        @character = character
        @feature   = feature
      end

      def filter(attack)
        trainer = Cheesewhiz.new(character)
        trained = trainer.trained_value(attack.weapon, feature)
        modify(attack, trained)
      end

      def modify(attack, val)
        attack.other_bonus += val
        attack.damage.add_static(val)
      end
    end
  end
end
