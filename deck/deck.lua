SMODS.Atlas{
    key = "fusion_deck",
    path = "deck.png",
    px = 71,
    py = 95
}

SMODS.Back {
    key = "overconsumption",
    atlas = "fusion_deck",
    pos = { x = 0, y = 0 },
    config = { joker_slot = -1, hand_size = -1, hands = -1, discards = 1, consumable_slot = 2 },
    unlocked = false,
    loc_txt = {
        name = "Overconsumption Deck",
        text = {
            "{C:attention}Enhancement{} {C:tarot}tarot cards{}",
            "can {C:attention}enhance{} {X:attention,C:white}X2{} as many",
            "cards at a time",
            " ",
            "{C:red}-1{} {C:dark_edition}Joker slot{}",
            "{C:blue}+2{} {C:attention}Consumable slots{}",
            "{C:red}-1{} {C:blue}Hand size{}",
            "{C:red}-1{} {C:blue}Hand{} {C:attention}per{} round",
            "{C:blue}+1{} {C:red}Discard{} {C:attention}per{} round",
        },
        unlock = {
            "Have a single card",
            "with {C:attention}8 Enhancements{}",
            "in your deck",
        }
    },
    check_for_unlock = function(self, args)
        if args.type == 'modify_deck' then
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_fusenh_bonusXmultXwildXglassXsteelXstoneXgoldXlucky') then
                    return true
                end
            end
        end
        return false
    end
}
