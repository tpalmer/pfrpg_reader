module PfrpgReaders
  module Filters
    class WeaponFinesseMod
      attr_reader :character
      def initialize(character)
        @character = character
      end

      def filter(attack)
        if character.feats.find { |x| x.name == 'Weapon Finesse' }
          modify_attack_for_weapon_finesse(attack, character.dex_mod, character.str_mod)
        end
      end

      def modify_attack_for_weapon_finesse(attack, dex, str)
        if attack.weight_class == 'light' || attack.weight_class == 'natural'
          attack.filter_str << "Weapon Finesse: -#{dex}, +#{str}"
          attack.other_bonus += dex
          attack.other_bonus -= str
        end
      end
    end
  end
end
