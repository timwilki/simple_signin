module ApplicationHelper
  # Returns the full title on a per-page basis.
    def full_title(page_title = '')
      base_title = "Ruby on Rails Tutorial Sample App"
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

end
