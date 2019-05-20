//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#if os(macOS)
	import AppKit
#else
	import UIKit
#endif

#if canImport(CwlViews)
	import CwlViews
#endif

// NOTE: If using this with the `internal` access CwlViews (e.g. Xcode app templates) then you'll need to remove the `public` access modifiers from this file.
// e.g. search for `public ` and replace with nothing.

// MARK: - Binder Part 1: Binder
public class ___VARIABLE_basename___: Binder, ___VARIABLE_basename___Convertible {
	public var state: BinderState<Preparer>
	public required init(type: Preparer.Instance.Type, parameters: Preparer.Parameters, bindings: [Preparer.Binding]) {
		state = .pending(type: type, parameters: parameters, bindings: bindings)
	}
}

// MARK: - Binder Part 2: Binding
public extension ___VARIABLE_basename___ {
	enum Binding: ___VARIABLE_basename___Binding {
		case inheritedBinding(Preparer.Inherited.Binding)
		
		// 0. Static bindings are applied at construction and are subsequently immutable.
		/* case someProperty(Constant<PropertyType>) */

		// 1. Value bindings may be applied at construction and may subsequently change.
		/* case someProperty(Dynamic<PropertyType>) */

		// 2. Signal bindings are performed on the object after construction.
		/* case someFunction(Signal<FunctionParametersAsTuple>) */

		// 3. Action bindings are triggered by the object after construction.
		/* case someAction(SignalInput<CallbackParameters>) */

		// 4. Delegate bindings require synchronous evaluation within the object's context.
		/* case someDelegateFunction((Param) -> Result)) */
	}
}

// MARK: - Binder Part 3: Preparer
public extension ___VARIABLE_basename___ {
	struct Preparer: BinderEmbedderConstructor /* or BinderDelegateEmbedderConstructor */ {
		public typealias Binding = ___VARIABLE_basename___.Binding
		public typealias Inherited = ___VARIABLE_linkedBasename___.Preparer
		public typealias Instance = ___VARIABLE_platformPrefix______VARIABLE_basename___
		
		/*
		// If instance construction requires parameters, uncomment this
		public typealias Parameters = (paramOne, paramTwo)
		*/
		
		public var inherited = Inherited()
		public init() {}
		
		/*
		// If Preparer is BinderDelegateEmbedderConstructor, use these instead of the `init` on the previous line
		public var dynamicDelegate: Delegate? = nil
		public let delegateClass: Delegate.Type
		public init(delegateClass: Delegate.Type) {
			self.delegateClass = delegateClass
		}
		*/
		
		public func constructStorage(instance: Instance) -> Storage { return Storage() }
		public func inheritedBinding(from: Binding) -> Inherited.Binding? {
			if case .inheritedBinding(let b) = from { return b } else { return nil }
		}
	}
}

// MARK: - Binder Part 4: Preparer overrides
public extension ___VARIABLE_basename___.Preparer {
	/* If instance construction requires parameters, uncomment this
	func constructInstance(type: Instance.Type, parameters: Preparer.Parameters) -> Instance {
		return type.init(paramOne: parameters.0, paramTwo: parameters.1)
	}
	*/

	/* Enable if delegate bindings used or setup prior to other bindings required 
	mutating func prepareBinding(_ binding: Binding) {
		switch binding {
		case .inheritedBinding(let x): inherited.prepareBinding(x)
		case .someDelegate(let x): delegate().addMultiHandler(x, #selector(someDelegateFunction))
		default: break
		}
	}
	*/

	func applyBinding(_ binding: Binding, instance: Instance, storage: Storage) -> Lifetime? {
		switch binding {
		case .inheritedBinding(let x): return inherited.applyBinding(x, instance: instance, storage: storage)

		/* All bindings should have an "apply" (although some might simply return nil). Here are some typical examples... */
		/* case .someStatic(let x): instance.someStatic = x.value */
		/* case .someProperty(let x): return x.apply(instance) { i, v in i.someProperty = v } */
		/* case .someSignal(let x): return x.apply(instance) { i, v in i.something(v) } */
		/* case .someAction(let x): return instance.addListenerAndReturnLifetime(x) */
		/* case .someDelegate(let x): return nil */
		}
	}
}

// MARK: - Binder Part 5: Storage and Delegate
extension ___VARIABLE_basename___.Preparer {
	public typealias Storage = ___VARIABLE_linkedBasename___.Preparer.Storage
	/*
	// Use instead of previous line if additional runtime storage is required
	open class Storage: ___VARIABLE_linkedBasename___.Preparer.Storage {}
	*/
	
	/*
	// Enable if Preparer is BinderDelegateEmbedderConstructor
	open class Delegate: DynamicDelegate, ___VARIABLE_platformPrefix______VARIABLE_basename___Delegate {
		open func someDelegateFunction(_ ___VARIABLE_lowercaseBasename___: ___VARIABLE_platformPrefix______VARIABLE_basename___Delegate) -> Bool {
			return singleHandler(___VARIABLE_lowercaseBasename___)
		}
	}
	*/
}

// MARK: - Binder Part 6: BindingNames
extension BindingName where Binding: ___VARIABLE_basename___Binding {
	public typealias ___VARIABLE_basename___Name<V> = BindingName<V, ___VARIABLE_basename___.Binding, Binding>
			private static func name<V>(_ source: @escaping (V) -> ___VARIABLE_basename___.Binding) -> ___VARIABLE_basename___Name<V> {
		return ___VARIABLE_basename___Name<V>(source: source, downcast: Binding.___VARIABLE_lowercaseBasename___Binding)
	}
}
public extension BindingName where Binding: ___VARIABLE_basename___Binding {
	// You can easily convert the `Binding` cases to `BindingName` using the following Xcode-style regex:
	// Replace: case ([^\(]+)\((.+)\)$
	// With:    static var $1: ___VARIABLE_basename___Name<$2> { return .name(___VARIABLE_basename___.Binding.$1) }
}

// MARK: - Binder Part 7: Convertible protocols (if constructible)
public protocol ___VARIABLE_basename___Convertible: ___VARIABLE_linkedBasename___Convertible {
	func ___VARIABLE_lowercasePlatformPrefix______VARIABLE_basename___() -> ___VARIABLE_basename___.Instance
}
extension ___VARIABLE_basename___Convertible {
	public func ___VARIABLE_lowercasePlatformPrefix______VARIABLE_linkedBasename___() -> ___VARIABLE_linkedBasename___.Instance { return ___VARIABLE_lowercasePlatformPrefix______VARIABLE_basename___() }
}
extension ___VARIABLE_platformPrefix______VARIABLE_basename___: ___VARIABLE_basename___Convertible /* , HasDelegate // if Preparer is BinderDelegateEmbedderConstructor */ {
	public func ___VARIABLE_lowercasePlatformPrefix______VARIABLE_basename___() -> ___VARIABLE_basename___.Instance { return self }
}
public extension ___VARIABLE_basename___ {
	func ___VARIABLE_lowercasePlatformPrefix______VARIABLE_basename___() -> ___VARIABLE_basename___.Instance { return instance() }
}

// MARK: - Binder Part 8: Downcast protocols
public protocol ___VARIABLE_basename___Binding: ___VARIABLE_linkedBasename___Binding {
	static func ___VARIABLE_lowercaseBasename___Binding(_ binding: ___VARIABLE_basename___.Binding) -> Self
	func as___VARIABLE_basename___Binding() -> ___VARIABLE_basename___.Binding?
}
public extension ___VARIABLE_basename___Binding {
	static func ___VARIABLE_lowercaseLinkedBasename___Binding(_ binding: ___VARIABLE_linkedBasename___.Binding) -> Self {
		return ___VARIABLE_lowercaseBasename___Binding(.inheritedBinding(binding))
	}
}
extension ___VARIABLE_basename___Binding where Preparer.Inherited.Binding: ___VARIABLE_basename___Binding {
	func as___VARIABLE_basename___Binding() -> ___VARIABLE_basename___.Binding? {
		return asInheritedBinding()?.as___VARIABLE_basename___Binding()
	}
}
public extension ___VARIABLE_basename___.Binding {
	typealias Preparer = ___VARIABLE_basename___.Preparer
	func asInheritedBinding() -> Preparer.Inherited.Binding? { if case .inheritedBinding(let b) = self { return b } else { return nil } }
	func as___VARIABLE_basename___Binding() -> ___VARIABLE_basename___.Binding? { return self }
	static func ___VARIABLE_lowercaseBasename___Binding(_ binding: ___VARIABLE_basename___.Binding) -> ___VARIABLE_basename___.Binding {
		return binding
	}
}

// MARK: - Binder Part 9: Other supporting types

// MARK: - Binder Part 10: Test support
#if canImport(CwlViews)
	extension BindingParser where Downcast: ViewSubclassBinding {
		// You can easily convert the `Binding` cases to `BindingParser` using the following Xcode-style regex:
		// Replace: case ([^\(]+)\((.+)\)$
		// With:    public static var $1: BindingParser<$2, ViewSubclass.Binding, Downcast> { return .init(extract: { if case .$1(let x) = \$0 { return x } else { return nil } }, upcast: { \$0.asViewSubclassBinding() }) }
	}
#endif