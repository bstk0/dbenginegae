package br.com.caelum.vraptor.blank;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class X_IndexController {

	private final Result result;

	public X_IndexController(Result result) {
		this.result = result;
	}

	public void index() {
		result.include("variable", "VRaptor GAE DBEngine !");
	}
	
	@Path("/abc")
	public void other() {
		result.redirectTo(X_IndexController.class).index();
	}
}
