module ApplicationHelper
  # Returns the full title on a per-page basis.
    def full_title(page_title = '')
      base_title = "RollCall App"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
    end

    def sheetentry
      @team_member.signin_sheets.last
    end

    def in_or_out
        if sheetentry != nil && sheetentry.signedin?
         render 'shared/signout_form'
       elsif sheetentry != nil && sheetentry.signedin == false
         render 'shared/signin_form'
       else
         render 'shared/signin_form'
      end
    end

    def formatted_duration total_seconds
      hours = total_seconds / (60 * 60)
      minutes = (total_seconds / 60) % 60
      seconds = total_seconds % 60
      "#{ hours }:#{ minutes }:#{ seconds }"
    end

end
