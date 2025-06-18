package model;

import java.util.*;

public class Carrello {
    private Map<Integer, ItemCarrello> items = new HashMap<>();

    public void aggiungi(Videogioco v) {
        int id = v.getId();
        if (items.containsKey(id)) {
            ItemCarrello item = items.get(id);
            item.setQuantita(item.getQuantita() + 1);
        } else {
            items.put(id, new ItemCarrello(v, 1));
        }
    }

    public Collection<ItemCarrello> getItems() {
        return items.values();
    }

    public void rimuovi(int id) {
        items.remove(id);
    }

    public void svuota() {
        items.clear();
    }

    public double getTotale() {
        return items.values().stream()
                .mapToDouble(ItemCarrello::getTotale)
                .sum();
    }
}