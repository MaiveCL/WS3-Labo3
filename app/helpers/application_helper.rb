# Marie-Ève — 2025-11-13

module ApplicationHelper
    def fil_arianeAncien
        parts = request.path.split('/').reject(&:blank?)
        crumbs = []

        parts.each_with_index do |part, index|
        path = "/" + parts[0..index].join("/")

        # On transforme les IDs en noms si possible
        if part =~ /\A\d+\z/   # si c'est un nombre (ID)
            # On cherche un modèle connu selon le parent
            parent = parts[index - 1] rescue nil
            name = case parent
                when "mesmenus", "businesses"
                    business = Business.find_by(id: part)
                    business ? business.name : "Inconnu"
                else
                    part
                end
        else
            name = part.titleize
            name = "Accueil" if path == "/"  # remplace "/" par "Accueil"
        end

        crumbs << link_to(name, path)
        end

        safe_join(crumbs, " / ")
    end
end
