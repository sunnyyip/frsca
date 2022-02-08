// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go knative.dev/pkg/apis/duck/v1

package v1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// KRShaped is an interface for retrieving the duck elements of an arbitrary resource.
#KRShaped: _

// KResource is a skeleton type wrapping Conditions in the manner we expect
// resource writers defining compatible resources to embed it.  We will
// typically use this type to deserialize Conditions ObjectReferences and
// access the Conditions data.  This is not a real resource.
#KResource: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	status:    #Status            @go(Status)
}

// KResourceList is a list of KResource resources
#KResourceList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)
	items: [...#KResource] @go(Items,[]KResource)
}