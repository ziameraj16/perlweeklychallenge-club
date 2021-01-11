#!perl

###############################################################################
=comment

Perl Weekly Challenge 094, Task #2: Binary Tree to Linked List

=cut
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
package ListNode;
#==============================================================================

#------------------------------------------------------------------------------
sub new                                                           # Constructor
#------------------------------------------------------------------------------
{
    my ($class, $value) = @_;

    my  %self = ( value => $value, next => undef );

    return bless \%self, $class;
}

#------------------------------------------------------------------------------
sub value                                                         # Getter only
#------------------------------------------------------------------------------
{
    my ($self) = @_;

    return $self->{value};
}

#------------------------------------------------------------------------------
sub next                                                        # Getter/setter
#------------------------------------------------------------------------------
{
    my ($self, $new_next) = @_;

    if (defined $new_next)
    {
        $self->{next} = $new_next;
    }

    return $self->{next};
}

#==============================================================================
package SinglyLinkedList;
#==============================================================================

#------------------------------------------------------------------------------
sub new                                                           # Constructor
#------------------------------------------------------------------------------
{
    my ($class, $value) = @_;

    my  %self = ( head => undef );

    if (defined $value)
    {
        $self{head} = ListNode->new( $value );
    }

    return bless \%self, $class;
}

#------------------------------------------------------------------------------
sub head                                                        # Getter/setter
#------------------------------------------------------------------------------
{
    my ($self, $new_head) = @_;

    if (defined $new_head)
    {
        $self->{head} = $new_head;
    }

    return $self->{head};
}

#------------------------------------------------------------------------------
sub append
#------------------------------------------------------------------------------
{
    my ($self, $value) = @_;

    if (defined $value && $value ne '')
    {
        my $new_node = ListNode->new( $value );

        if (defined $self->head)
        {
            my $current = $self->head;

            $current = $current->next while defined $current->next;
        
            $current->next( $new_node );
        }
        else
        {
            $self->head( $new_node );
        }
    }
}

#------------------------------------------------------------------------------
sub display
#------------------------------------------------------------------------------
{
    my ($self) = @_;
    my  $display;

    if (defined $self->head)
    {
        my $first = 1;

        for (my $node = $self->head; defined $node; $node = $node->next)
        {
            $display .= ' -> ' unless $first;
            $first    = 0;
            $display .= $node->value;
        }
    }
    else
    {
        $display = '(empty)';
    }

    return $display;
}

##############################################################################
1;
##############################################################################