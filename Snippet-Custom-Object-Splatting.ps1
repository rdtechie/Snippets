$customObject   = [ordered]@{
    Name 		    = '<name>'
    Job 	  	  = '<jobname>'
    Company 	  = '<companyname>'
    EMail		    = '<mailaddress>'
    BloggerAt 	= 'http://<url>'
    ModeratorAt = 'http://<url>'
    Twitter 	  = 'http://twitter.com/<username>'
    GitHub 		  = 'https://github.com/<username>'
}

New-Object -TypeName PSObject -ArgumentList $customObject
