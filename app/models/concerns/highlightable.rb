module Highlightable 
    extend ActiveSupport::Concern
    included do 
        validate :single_highlight
        
        def single_highlight
            any_entity = has_any_other_highkighted?(Movie) 
            any_entity ||= has_any_other_highkighted?(Serie) unless any entity
            
            if highlighted && any_entity
                errors.add(:single_highlight, "Only one highlighted entity is permitted")
            end
        end

        def has_any_other_highkighted?(model)
            records = model.where(highlighted: true)
            
            if self.class == model
                return records.where.not(id: self.id).any?
            end

            records.any?

        end
    end
    
end