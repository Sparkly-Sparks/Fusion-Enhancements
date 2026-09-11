SMODS.Atlas {
    key = "sleeve_atlas",
    path = "sleeve.png",
    px = 73,
    py = 95
}

if CardSleeves then
    CardSleeves.Sleeve {
        key = "overconsumption",
        name = "Overconsumption Sleeve",
        atlas = "sleeve_atlas",
        pos = { x = 0, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_fusenh_overconsumption" },
        loc_vars = function(self)
            local key
            local vars = {}
            if self.get_current_deck_key() == "b_fusenh_overconsumption" then
                key = self.key .. "_alt"
                self.config = { joker_slot = -1, consumable_slot = 1 }
                local card_set_cost_value_ref = Card.set_cost_value
                function Card:set_cost_value(...)
                    local ret = card_set_cost_value_ref(self, ...)
                    if (self.ability.set == 'Tarot' or (self.ability.set == 'Booster' and self.config.center.kind == 'Arcana')) then self.cost = 0 end
                    return ret
                end
            else
                key = self.key
                self.config = { joker_slot = -1, hand_size = -1, hands = -1, discards = 1, consumable_slot = 2 }
            end
            return { key = key, vars = vars }
        end,
        check_for_unlock = function(self, args)
            -- see function check_for_unlock(args) at functions/common_events.lua:1163 in the base-game for more unlock types
            if args and args.type == 'win_deck' and get_deck_win_stake(self.unlock_condition.deck) > 0 then
                return true
            end
        end,
        locked_loc_vars = function(self, info_queue, card)
            -- very similar to loc_vars
            local key = "sleeve_locked_deck"
            --[[ Localization key:
            -- Define this key "globally" under the `Sleeve` set, not as sub-entry of your specific sleeve.
            -- For an example, look at the `sleeve_locked` entry as used by CardSleeves in the localization files. Do NOT overwrite the `sleeve_locked` key.
            --]]
            local vars = { "Overconsumption Deck" }
            return { key = key, vars = vars }
        end
    }
end
