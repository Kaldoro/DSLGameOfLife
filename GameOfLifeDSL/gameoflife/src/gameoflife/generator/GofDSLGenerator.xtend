/*
 * generated by Xtext 2.25.0
 */
package gameoflife.generator


import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import gameoflife.gofDSL.Model

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class GofDSLGenerator extends AbstractGenerator { 
 
  override void doGenerate(Resource resource, IFileSystemAccess2 fsa, 
                               IGeneratorContext context) { 
   val root = resource.allContents.head as Model; 
   if (root !== null) { 
			fsa.generateFile('../../GoLruntime.zip_expanded/GoLruntime/short.life/src/GameOfLife/RulesOfLife.java', JavaGenerator.toRulesFile(root));
       } 
   } 
}