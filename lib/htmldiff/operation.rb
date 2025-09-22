module HTMLDiff
  # An operation represents one difference between the old HTML and the new
  # HTML. e.g. adding three letters.
  # @param operation can be :insert, :delete or :equal

  Operation = Struct.new(:action, :old_words, :new_words)

  class Operation
    # @!method action
    # @!method start_in_old
    # @!method end_in_old
    # @!method start_in_new
    # @!method end_in_new
    # @!method old_words
    # @!method new_words

    # Unless `compare_attributes` is true, Ignores any attributes and tells us
    # if the tag is the same e.g. <p> and <p style="margin: 2px;"> are the same.
    def same_tag?(compare_attributes = false)
      pattern = /<(?<name>[^>\s]+)\s(?<attrs>.*)[\s>].*/
      first_tag = pattern.match(old_text) # nil means they are not tags
      first_tagname = first_tag[:name] if first_tag

      second_tag = pattern.match(new_text)
      second_tagname = second_tag[:name] if second_tag

      return false unless first_tag && second_tag

      if compare_attributes
        first_attrs = first_tag[:attrs]
        second_attrs = first_tag[:attrs]
        return false if first_attrs && (first_attrs == second_attrs)
      end

      first_tagname == second_tagname
    end

    def old_text
      old_words.join
    end

    def new_text
      new_words.join
    end
  end
end
