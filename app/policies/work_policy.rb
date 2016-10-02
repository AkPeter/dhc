class WorkPolicy

  attr_reader :user, :work

  def initialize(user, work)
    @user = user
    @work = work
  end

  def new?
    @user.editor? or @user.admin?
  end

  def create?
    @user.editor? or @user.admin?
  end

  def edit?
    @user.editor? or @user.admin?
  end

  def update?
    @user.editor? or @user.admin?
  end

  def destroy?
    @user.editor? or @user.admin?
  end

end