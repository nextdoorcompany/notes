(setq org-publish-project-alist
      '(("keyboard"
         :base-directory "~/notes/"
         :exclude "org"
         :include ("keyboard.org")
         :publishing-function org-html-publish-to-html
         :publishing-directory "~/public_html")))
