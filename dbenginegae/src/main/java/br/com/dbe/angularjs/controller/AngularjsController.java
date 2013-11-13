package br.com.dbe.angularjs.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class AngularjsController {

	private final Result result;

	public AngularjsController(Result result) {
		this.result = result;
	}

	@Path("/angularjs/index")
	public void index() {
		//result.include("variable", "Z - VRaptor GAE DBEngine !");
	}
	
//	@Path("/zabc")
//	public void other() {
//		result.redirectTo(AngularjsController.class).index();
//	}
	
}
