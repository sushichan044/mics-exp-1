#ifndef BIPMATCHING_H_INCLUDED
#define BIPMATCHING_H_INCLUDED

#include "dfs.h"

/* ************************** */
/* maximum-matching algorithm */
/* ************************** */

void construct_digraph_for_matching(graph *g)
{
	int i, source, sink;
	source = g->nvertices; insert_vertex(g);
	sink   = g->nvertices; insert_vertex(g);
	for(i = 0; i < g->nvertices -2; i++) {
		if(g->degree[i]==0) insert_edge(g, i, sink);
		else                insert_edge(g, source, i);
	}
	return;
}


void augment(graph *g, dfs_info *d_i, graph *matching, int start, int end)
{
	/** ‚±‚±‚ðŠeŽ©‚ªŽÀ‘•‚·‚é **/
	return;
}

int find_maximum_matching(graph *g, graph *matching)
{
	int size = 0;			/* the size of a current matching */
	int source, sink;
	dfs_info *d_i;
	
	source = g->nvertices -2;
	sink   = g->nvertices -1;
	d_i = (dfs_info*)malloc(sizeof(dfs_info));

  /** ‚±‚±‚ðŠeŽ©‚ªŽÀ‘•‚·‚é **/

	return size;
}

#endif
