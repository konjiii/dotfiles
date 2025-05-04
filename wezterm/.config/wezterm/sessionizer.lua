local sessionizer = {}

sessionizer.schema = {
	Sessionizer.DefaultWorkspace({}),
	Sessionizer.AllActiveWorkspaces({}),
	Sessionizer.FdSearch("./mhome"), -- Searches for git repos in ~/my_projects
}

return sessionizer
