LootJS.lootTables(event => {
    event
        .getLootTable("creaturefeature:entities/dreamweaver")
        .firstPool()
        .addEntry(LootEntry.of("crittersandcompanions:silk").withWeight(10).setCount([1, 3]))
})

LootJS.lootTables(event => {
    event.getLootTable("creaturefeature:entities/dreamweaver").firstPool().removeItem("creaturefeature:dream_silk")
})

RecipeViewerEvents.removeEntries('item', event => {
    event.remove('creaturefeature:dream_catcher')
})

RecipeViewerEvents.removeEntries('item', event => {
    event.remove('creaturefeature:dream_silk')
})