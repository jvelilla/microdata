note
	description: "Summary description for {XML_SELECTOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	XML_ELEMENT_SELECTOR

inherit
	XML_NODE_SELECTOR [XML_ELEMENT]

create
	make,
	make_with_filter

feature -- Settings

	select_elements_with_name (a_name: READABLE_STRING_GENERAL)
		local
			f: XML_NODE_AGENT_FILTER [XML_ELEMENT]
		do
			create {XML_NODE_AGENT_FILTER [XML_ELEMENT]} filter.make (agent (n: XML_NODE; ia_name: READABLE_STRING_GENERAL): BOOLEAN
					do
						if attached {XML_ELEMENT} n as e then
							Result := ia_name.same_string (e.name)
						end
					end (?, a_name)
				)
			items.wipe_out
		end

	select_elements_with_attribute (a_name: READABLE_STRING_GENERAL; a_value: detachable READABLE_STRING_GENERAL)
		do
			create {XML_NODE_AGENT_FILTER [XML_ELEMENT]} filter.make (agent (n: XML_NODE; ia_name: READABLE_STRING_GENERAL; ia_value: detachable READABLE_STRING_GENERAL): BOOLEAN
					do
						if attached {XML_ELEMENT} n as e then
							if attached e.attribute_by_name (ia_name) as att then
								Result := ia_value = Void or else ia_value.same_string (att.value)
							end
						end
					end (?, a_name, a_value)
				)
			items.wipe_out
		end

end
