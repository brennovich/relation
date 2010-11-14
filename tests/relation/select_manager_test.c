#include <cgreen/cgreen.h>
#include "relation.h"
#include "relation/tree_manager.h"
#include "relation/select_manager.h"
#include "relation/table.h"
#include "test_helper.h"

RelationTable users;
static void before_all() {
	users = new_relation_table("users");
}

static void project_should_accept_strings() {
	// SelectManager select_manager;
	// select_manager = select_manager_project(select_manager, "id");
	// select_manager = select_manager_from(select_manager, users);
	// assert_string_equal(relation_to_sql(select_manager), "SELECT id FROM users");
}

TestSuite *select_manager_suite() {
	TestSuite *suite = create_test_suite();
	setup(suite, before_all);
	
	add_test(suite, project_should_accept_strings);
	return suite;
}