//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package com.ghostlmm.lightMVC.api
{

	
	/**
	 * The <code>Injector</code> manages the mappings and acts as the central hub from which all
	 * injections are started.
	 */
	public interface IInjector 
	{
		

		
		function createInstance(type:Class):*;

		/**
		 * Does this injector (or any parents) have a mapping for the given type?
		 * @param type The type
		 * @param name Optional name
		 * @return True if the mapping exists
		 */
		function hasMapping(type:Class):Boolean;


		/**
		 * Maps a request description, consisting of the <code>type</code> and, optionally, the
		 * <code>name</code>.
		 *
		 * <p>The returned mapping is created if it didn't exist yet or simply returned otherwise.</p>
		 *
		 * <p>Named mappings should be used as sparingly as possible as they increase the likelyhood
		 * of typing errors to cause hard to debug errors at runtime.</p>
		 *
		 * @param type The <code>class</code> describing the mapping
		 * @param name The name, as a case-sensitive string, to further describe the mapping
		 *
		 * @return The <code>InjectionMapping</code> for the given request description
		 *
		 * @see #unmap()
		 * @see org.swiftsuspenders.mapping.InjectionMapping
		 */
//		function map(type:Class, name:String = ''):InjectionMapping;
		
		function mapSingleton(interfaceType:Class,targetType:Class=null):void;
		
		function mapSingletonValue(interfaceType:Class,value:*,targetType:Class=null):void;

		/**
		 *  Removes the mapping described by the given <code>type</code> and <code>name</code>.
		 *
		 * @param type The <code>class</code> describing the mapping
		 * @param name The name, as a case-sensitive string, to further describe the mapping
		 *
		 * @throws org.swiftsuspenders.errors.InjectorError Descriptions that are not mapped can't be unmapped
		 * @throws org.swiftsuspenders.errors.InjectorError Sealed mappings have to be unsealed before unmapping them
		 *
		 * @see #map()
		 * @see org.swiftsuspenders.mapping.InjectionMapping
		 * @see org.swiftsuspenders.mapping.InjectionMapping#unseal()
		 */
		function unmap(type:Class):void;

		


		/**
		 * Instantiates the class identified by the given <code>type</code> and <code>name</code>.
		 *
		 * <p>The parameter <code>targetType</code> is only useful if the
		 * <code>InjectionMapping</code> used to satisfy the request might vary its result based on
		 * that <code>targetType</code>. An Example of that would be a provider returning a logger
		 * instance pre-configured for the instance it is used in.</p>
		 *
		 * @param type The <code>class</code> describing the mapping
		 * @param name The name, as a case-sensitive string, to use for mapping resolution
		 * @param targetType The type of the instance that is dependent on the returned value
		 *
		 * @return The mapped or created instance
		 *
		 * @throws org.swiftsuspenders.errors.InjectorMissingMappingError if no mapping was found
		 * for the specified dependency and no <code>fallbackProvider</code> is set.
		 */
		function getInstance(type:Class):*;

		
	}
}
