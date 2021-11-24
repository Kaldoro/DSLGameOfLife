/*
 * generated by Xtext 2.25.0
 */
package gameoflife.ide

import com.google.inject.Guice
import gameoflife.GofDSLRuntimeModule
import gameoflife.GofDSLStandaloneSetup
import org.eclipse.xtext.util.Modules2

/**
 * Initialization support for running Xtext languages as language servers.
 */
class GofDSLIdeSetup extends GofDSLStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new GofDSLRuntimeModule, new GofDSLIdeModule))
	}
	
}
